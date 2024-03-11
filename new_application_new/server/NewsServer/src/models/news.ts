export class News {
    id: number;
    title: string;
    author: string;
    publishedAt: string;
    url: string;
    description: string;
    content: string;
    urlToImage: string;
    liked: boolean;
  
    constructor(id: number, title: string,author: string, publishedAt: string,
      url: string, description: string, content: string, urlToImage: string,
      liked: boolean) {
      this.id = id;
      this.title = title;
      this.author = author;
      this.publishedAt = publishedAt;
      this.url = url;
      this.description = description;
      this.content = content;
      this.urlToImage = urlToImage;
      this.liked = liked;
    }
  }
  