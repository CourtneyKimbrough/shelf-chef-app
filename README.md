# 🧑‍🍳 Shelf Chef

![Sinatra](https://img.shields.io/badge/Ruby%20Sinatra-000000.svg?style=for-the-badge&logo=Ruby-Sinatra&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![OpenAI](https://a11ybadges.com/badge?logo=openai)






**Shelf Chef** is a web app that helps you find recipes based on ingredients you already have at home.
Just input what’s in your kitchen, and Shelf Chef will suggest meals you can make!

---

## 🛠️ Setup & Installation

1. **Clone the repo:**
	```sh
	git clone https://github.com/CourtneyKimbrough/shelf-chef-app.git
	cd shelf-chef-app
	```
2. **Install dependencies:**
	```sh
	bundle install
	```
3. **Set up environment variables:**
	- Copy `.env.example` to `.env` and add your OpenAI API key:
	  ```sh
	  cp .env.example .env
	  # Then edit .env and set OPENAI_API_KEY=your-key-here
	  ```

---

## ▶️ Usage

Start the app locally:

```sh
bundle exec rackup
# or
bundle exec ruby app.rb
```

Visit [http://localhost:9292](http://localhost:9292) in your browser.

---

## ⚙️ Environment Variables

- `OPENAI_API_KEY` – Your OpenAI API key (required)

---

## 🧪 Running Tests

Run all tests:

```sh
bundle exec rspec
```

Tests include unit, feature, and request/controller specs.

---

## 🚀 Deployment

This app is ready to deploy on platforms like Render, Heroku, or any Rack-compatible host.

- Make sure to set the `OPENAI_API_KEY` environment variable in your deployment settings.
- If using Render, see `render.yaml` for configuration.

---

---

## 🚀 Live Demo

https://shelf-chef.onrender.com

---

![Demo](public/demo.gif)





---
