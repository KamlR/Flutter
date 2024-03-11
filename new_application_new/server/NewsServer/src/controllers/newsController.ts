import express, { Request, Response } from 'express';
import { Pool } from 'pg';
import { News } from '../models/news';

const newsController = express.Router();

const dbConfig = {
    user: 'karina',
    host: 'localhost',
    database: 'news',
    password: 'admin',
    port: 5432,
  };

  const pool = new Pool(dbConfig);
  newsController.get('/getall', async (req: Request, res: Response) => {
    try {
      const result = await pool.query('SELECT * FROM news');
      const news = result.rows.map((row) => new News(row.id, row.title, row.author, row.publishedAt, row.url, row.description, row.content, row.urlToImage, row.liked));
      res.json(news);
    } catch (error) {
      console.error('Ошибка при получении списка новостей из PostgreSQL:', error);
      res.status(500).json({ error: 'Ошибка сервера' });
    }
  });
  newsController.get('/liked', async (req: Request, res: Response) => {
    try {
      const result = await pool.query('SELECT * FROM news WHERE liked = $1', [true]);
      const news = result.rows.map((row) => new News(row.id, row.title, row.author, row.publishedAt, row.url, row.description, row.content, row.urlToImage, row.liked));
      res.json(news);
    } catch (error) {
      console.error('Ошибка при получении списка избранных новостей из PostgreSQL:', error);
      res.status(500).json({ error: 'Ошибка сервера' });
    }
  });

  newsController.post('/like/:id', async (req: Request, res: Response) => {
    const newsId = req.params.id;
    try{
        const result = await pool.query('UPDATE news SET liked = $1 WHERE id = $2', [true, newsId]);
        res.status(200).json();
    }
    catch(error){
      console.error('Ошибка при обновлении статуса новости в PostgreSQL:', error);
      res.status(500).json({ error: 'Ошибка сервера' });
    }
  });
  newsController.post('/unlike/:id', async (req: Request, res: Response) => {
    const newsId = req.params.id;
    try{
        const result = await pool.query('UPDATE news SET liked = $1 WHERE id = $2', [false, newsId]);
        res.status(200).json();
    }
    catch(error){
      console.error('Ошибка при обновлении статуса новости в PostgreSQL:', error);
      res.status(500).json({ error: 'Ошибка сервера' });
    }
  });

  export default newsController;