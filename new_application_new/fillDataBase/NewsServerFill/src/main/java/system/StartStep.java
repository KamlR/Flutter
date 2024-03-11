package system;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import models.News;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class StartStep {
    private String url = "jdbc:postgresql://localhost:5432/news";
    private String username = "karina";
    private String password = "admin";
    public void formAllNews(){
        ObjectMapper objectMapper = new ObjectMapper();
        String serverAnswer = getDataFromBackend("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2702c0cdc3d74f15a4aca600b827bcde");

        try {
            JsonNode rootNode = objectMapper.readTree(serverAnswer);
            JsonNode articlesNode = rootNode.get("articles");
            String articlesString = objectMapper.writeValueAsString(articlesNode);
            ArrayList<News> listNews = objectMapper.readValue(articlesString, new TypeReference<>() {});
            putDataInDataBase(listNews);
        } catch (JsonProcessingException e) {
            System.out.println(e.getMessage());
        }
    }

    private String getDataFromBackend(String urlString){
        StringBuilder response = new StringBuilder();
        try {
            // Создание объекта URL с указанным URL
            URL url = new URL(urlString);

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setRequestMethod("GET");

            int responseCode = connection.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String line;

                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();
            } else {
                System.out.println("Failed to get response from server. Response code: " + responseCode);
            }
            connection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response.toString();
    }

    private void putDataInDataBase(ArrayList<News> newsList){
        try(Connection connection = DriverManager.getConnection(url, username, password)){
            String sql = "INSERT INTO news (title, author, publishedAt, url, description, content, urlToImage, liked) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            for (News news : newsList) {
                statement.setString(1, news.getTitle());
                statement.setString(2, news.getAuthor());
                statement.setString(3, news.getPublishedAt());
                statement.setString(4, news.getUrl());
                statement.setString(5, news.getDescription());
                statement.setString(6, news.getContent());
                statement.setString(7, news.getUrlToImage());
                statement.setBoolean(8, false);

                statement.executeUpdate();
            }
        }
        catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }
}
