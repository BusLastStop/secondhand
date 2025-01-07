package com.bus.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONArray;
import org.json.JSONObject;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class NominatimGeocoding {

    public static String getLatLng(String address) {
        String baseUrl = "https://nominatim.openstreetmap.org/search";
        String url = null;
        try {
            // URL 인코딩
            url = String.format("%s?q=%s&format=json&addressdetails=1&limit=1", baseUrl, URLEncoder.encode(address, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            return "주소 인코딩 오류: " + e.getMessage();
        }

        try (CloseableHttpClient client = HttpClients.createDefault()) {
            HttpGet request = new HttpGet(url);
            request.setHeader("User-Agent", "Mozilla/5.0"); // Nominatim은 User-Agent 헤더가 필요함
            try (CloseableHttpResponse response = client.execute(request)) {
                if (response.getStatusLine().getStatusCode() == 200) {
                    ObjectMapper mapper = new ObjectMapper();
                    JsonNode root = mapper.readTree(response.getEntity().getContent());
                    if (root.isArray() && root.size() > 0) {
                        JsonNode location = root.get(0);

                        // 주소의 위도, 경도, 우편번호, 상세 주소 가져오기
                        String lat = location.get("lat").asText();
                        String lon = location.get("lon").asText();
                        String postcode = location.path("address").path("postcode").asText("우편번호를 찾을 수 없습니다.");
                        String addressLine = location.path("display_name").asText("상세 주소를 찾을 수 없습니다.");

                        // 원하는 포맷으로 반환
                        return String.format("위도: %s, 경도: %s, 우편번호: %s, 상세 주소: %s", lat, lon, postcode, addressLine);
                    } else {
                        return "주소를 찾을 수 없습니다.";
                    }
                } else {
                    return "HTTP Error: " + response.getStatusLine().getStatusCode();
                }
            }
        } catch (Exception e) {
            return "IOException: " + e.getMessage();
        }
    }
    
    public static List<Map<String, String>> searchAddress(String address) throws Exception {
        String apiUrl = "https://nominatim.openstreetmap.org/search?q=" + 
                        URLEncoder.encode(address, "UTF-8") + 
                        "&format=json&addressdetails=1";
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            response.append(line);
        }
        br.close();

        // JSON 파싱
        JSONArray jsonArray = new JSONArray(response.toString());
        List<Map<String, String>> results = new ArrayList<>();

        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject obj = jsonArray.getJSONObject(i);
            Map<String, String> result = new HashMap<>();
            result.put("address", obj.getString("display_name"));
            result.put("lat", obj.getString("lat"));
            result.put("lng", obj.getString("lon"));
            results.add(result);
        }
        return results;
    }
}
