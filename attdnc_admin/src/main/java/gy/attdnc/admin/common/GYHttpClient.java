package gy.attdnc.admin.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class GYHttpClient {
	protected final Logger logger = LoggerFactory.getLogger(getClass().getSimpleName());

	private static String mContentType = "application/json";
	
	public void setContentType(String contentType) {
		mContentType = contentType;
	}

	public synchronized String request(String url, String params) {

		OutputStream os = null;
		BufferedReader reader = null;
		HttpURLConnection conn = null;

		try {
			if(url.startsWith("https://")) {
				httpsInit();
				conn = (HttpsURLConnection) new URL(url).openConnection();	
			} else {
				conn = (HttpURLConnection) new URL(url).openConnection();
			}
			
			conn.setRequestProperty("Content-Type", mContentType);
			conn.setRequestMethod("POST");

			conn.setDoOutput(true);
			conn.connect();

			logger.error("request : " + params);

			os = conn.getOutputStream();
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));
			writer.write(params);
			writer.flush();
			writer.close();

			logger.error("responseCode : " + conn.getResponseCode());
			logger.error("responseMessage : " + conn.getResponseMessage());

			InputStream is = conn.getInputStream();

			BufferedReader in = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			StringBuilder sb = new StringBuilder();
			String line;

			while((line = in.readLine()) != null) {
				if(sb.length() > 0) {
					sb.append("\n");
				}
				sb.append(line);
			}
			logger.error("RESPONSE >>> " + sb.toString());
			return sb.toString();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (os != null) {
				try {
					os.close();
				} catch (IOException e) {
				}
			}
			
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
				}
			}
		}
		
		return null;
	}
	
	private void trustEveryone() {
		try {
			HttpsURLConnection.setDefaultHostnameVerifier(new HostnameVerifier(){
				public boolean verify(String hostname, SSLSession session) {
					return true;
				}});
			SSLContext context = SSLContext.getInstance("TLS");
			context.init(null, new X509TrustManager[]{new X509TrustManager(){
				public void checkClientTrusted(X509Certificate[] chain,
											   String authType) throws CertificateException {}
				public void checkServerTrusted(X509Certificate[] chain,
											   String authType) throws CertificateException {}
				public X509Certificate[] getAcceptedIssuers() {
					return new X509Certificate[0];
				}}}, new SecureRandom());
			HttpsURLConnection.setDefaultSSLSocketFactory(
					context.getSocketFactory());
		} catch (Exception e) { // should never happen
			e.printStackTrace();
		}
	}
	
	Boolean initialized = false;
	
	private synchronized void httpsInit() {
		synchronized(initialized) {
			if(initialized.booleanValue()) return;
		    /*
		     *  fix for
		     *    Exception in thread "main" javax.net.ssl.SSLHandshakeException:
		     *       sun.security.validator.ValidatorException:
		     *           PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException:
		     *               unable to find valid certification path to requested target
		     */
		    TrustManager[] trustAllCerts = new TrustManager[] {
		       new X509TrustManager() {
		          public java.security.cert.X509Certificate[] getAcceptedIssuers() {
		            return null;
		          }
	
		          public void checkClientTrusted(X509Certificate[] certs, String authType) {  }
	
		          public void checkServerTrusted(X509Certificate[] certs, String authType) {  }
	
		       }
		    };
	
		    SSLContext sc = null;
			try {
				sc = SSLContext.getInstance("SSL");
				sc.init(null, trustAllCerts, new java.security.SecureRandom());
			} catch (KeyManagementException e) {
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		    HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
	
		    // Create all-trusting host name verifier
		    HostnameVerifier allHostsValid = new HostnameVerifier() {
		        public boolean verify(String hostname, SSLSession session) {
		          return true;
		        }
		    };
		    // Install the all-trusting host verifier
		    HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
		    /*
		     * end of the fix
		     */
		    initialized = Boolean.TRUE;
		}
	}
}
