package gy.attdnc.admin.common.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;

public class GoogleGeocodingAPI {

	public String request(String params) {
		try {
			URL url = new URL("http://maps.googleapis.com/maps/api/geocode/json?sensor=false&language=ko&"+params);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			return response.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void main(String[] ar) {
		try {
			String string = new GoogleGeocodingAPI().request("삼성 무역센터");
			
			JSONObject result = new JSONObject(string);
			System.out.println(result.toString());
			
			JSONArray array = result.getJSONArray("results");
			for(int i=0; i<array.length(); i++) {
				JSONObject item = array.getJSONObject(i);
				System.out.println(item.toString());
				System.out.println(item.getString("formatted_address"));
				System.out.println(item.getJSONObject("geometry").getJSONObject("location").toString());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
