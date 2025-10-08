# 🎬 WatchNext Platform

> Personal entertainment tracking system with analytics and performance testing

[![Node.js](https://img.shields.io/badge/Node.js-18+-brightgreen.svg)](https://nodejs.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-blue.svg)](https://www.postgresql.org/)
[![Express](https://img.shields.io/badge/Express-4.x-lightgrey.svg)](https://expressjs.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📖 About

WatchNext is a full-stack platform for tracking movies and series you watch, with features for rating, reviewing, and discovering new content. Built as a learning project to master testing, Git workflows, and data analytics.

## ✨ Features

- 🎬 Track movies and TV series
- ⭐ Rate and review content
- 📊 Personal statistics and insights
- 👥 Social features (friends, watch parties)
- 📈 Data analytics with SQL & Python
- 🧪 Fully tested with Jest and k6

## 🛠️ Tech Stack

**Backend:** Node.js, Express, PostgreSQL  
**Testing:** Jest (unit), k6 (load)  
**Analytics:** SQL, Python, Pandas, Matplotlib  
**DevOps:** Git, GitHub, CI/CD (planned)

## 📁 Project Structure

```
watchnext-platform/
│
├── backend/
│   ├── src/
│   │   ├── controllers/
│   │   ├── routes/
│   │   └── db.js
│   ├── __tests__/
│   │   ├── unit/
│   │   └── integration/
│   ├── server.js
│   └── package.json
│
├── database/
│   └── schema.sql
│
├── k6-tests/
│   └── api-load-test.js
│
├── data-analysis/
│   ├── sql/
│   ├── python/
│   └── notebooks/
│
└── README.md
```

## 🚀 Quick Start

### Prerequisites

```bash
Node.js 18+
PostgreSQL 16+
npm or yarn
```

### Installation

```bash
# Clone repository
git clone https://github.com/Kvemzi/watchnext-platform.git
cd watchnext-platform

# Setup database
sudo -u postgres psql -c "CREATE DATABASE watchnext;"
sudo -u postgres psql watchnext < database/schema.sql

# Install dependencies
cd backend
npm install

# Start server
npm run dev
```

### Verify Installation

```bash
# Health check
curl http://localhost:3000/health

# Get content
curl http://localhost:3000/api/content
```

## 📡 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/health` | Health check |
| GET | `/` | API information |
| GET | `/api/content` | Get all content |
| GET | `/api/content?type=movie` | Filter by type |
| GET | `/api/content/:id` | Get specific content |

### Coming Soon
- `POST /api/watched` - Mark content as watched
- `GET /api/watched/:userId` - Get watch history
- `POST /api/watchlist` - Add to watchlist
- `GET /api/stats/:userId` - User statistics

## 🧪 Testing

```bash
# Unit tests (Jest)
npm test
npm run test:watch
npm run test:coverage

# Load tests (k6)
cd k6-tests
k6 run api-load-test.js
```

## 📊 Current Stats

| Metric | Value |
|--------|-------|
| Database Tables | 5 |
| Sample Users | 3 |
| Sample Content | 6 movies/series |
| API Endpoints | 2 functional |
| Git Commits | 9+ |
| Test Coverage | Ready for implementation |

## 🗄️ Database Schema

### Core Tables

- **users** - User accounts and profiles
- **content** - Movies and TV series information
- **watched** - Watch history with ratings and reviews
- **watchlist** - Content users want to watch
- **friendships** - Social connections between users

### Sample Data

- Users: `marko123`, `ana_movies`, `filmfan`
- Movies: Inception, The Matrix, Interstellar, The Dark Knight
- Series: Breaking Bad, Stranger Things
- Watch records with ratings and reviews

## 📈 Analytics Queries

Located in `data-analysis/sql/`:

**Example Query:**
```sql
-- Top 5 most watched content
SELECT 
    c.title,
    c.type,
    COUNT(w.id) as watch_count,
    AVG(w.rating) as avg_rating
FROM content c
JOIN watched w ON c.id = w.content_id
GROUP BY c.id
ORDER BY watch_count DESC
LIMIT 5;
```

## 🎯 Learning Goals

### ✅ Week 1-2: Testing & Git
- [x] Git feature branch workflow
- [x] PostgreSQL database setup
- [x] REST API development with Express
- [ ] Jest unit tests
- [ ] k6 load tests
- [ ] CI/CD pipeline

### 📅 Week 3-4: Data Analytics
- [ ] SQL aggregations and analytics
- [ ] Python data analysis (Pandas)
- [ ] Data visualization (Matplotlib)
- [ ] Jupyter notebooks
- [ ] Interactive dashboards (Streamlit)

### 🚀 Week 5+: Advanced Features
- [ ] Recommendation engine
- [ ] User authentication (JWT)
- [ ] Social features implementation
- [ ] Real-time updates
- [ ] Cloud deployment

## 🔧 Development Workflow

### Feature Branch Process

```bash
# Create feature branch
git checkout -b feature/new-feature

# Make changes and commit
git add .
git commit -m "feat: Add new feature"

# Merge to main
git checkout main
git merge feature/new-feature

# Clean up
git branch -d feature/new-feature

# Push to GitHub
git push origin main
```

### Commit Convention

Following conventional commits specification:

- `feat:` New feature
- `fix:` Bug fix
- `test:` Adding or updating tests
- `docs:` Documentation changes
- `refactor:` Code refactoring
- `chore:` Maintenance tasks

## 🐛 Troubleshooting

### PostgreSQL Connection Issues

```bash
# Check if PostgreSQL is running
sudo systemctl status postgresql

# Restart if needed
sudo systemctl restart postgresql

# Test connection
sudo -u postgres psql watchnext -c "SELECT COUNT(*) FROM users;"
```

### Server Won't Start

```bash
# Check if port 3000 is in use
lsof -i :3000

# Kill process if needed
kill -9 <PID>
```

### Dependencies Issues

```bash
# Clean reinstall
rm -rf node_modules package-lock.json
npm install
```

## 📝 NPM Scripts

```bash
npm run dev          # Start development server with nodemon
npm start            # Start production server
npm test             # Run Jest test suite
npm run test:watch   # Run tests in watch mode
npm run test:coverage # Generate coverage report
```

## 🤝 Contributing

This is a personal learning project, but suggestions and feedback are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

MIT License - Feel free to use this project for learning purposes!

## 👨‍💻 Author

**Kvemzi**
- **Focus:** Jest, k6, Git/GitHub, Data Analytics
- **Project:** WatchNext Platform
- **Started:** January 9, 2025

## 🙏 Acknowledgments

- [The Movie Database (TMDb)](https://www.themoviedb.org/) - For movie data API (future integration)
- [Jest](https://jestjs.io/) - Delightful JavaScript testing framework
- [k6](https://k6.io/) - Modern load testing tool
- [PostgreSQL](https://www.postgresql.org/) - Powerful open-source database

## 📚 Useful Resources

- [Express.js Documentation](https://expressjs.com/)
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- [Jest Getting Started](https://jestjs.io/docs/getting-started)
- [k6 Documentation](https://k6.io/docs/)
- [Node.js Best Practices](https://github.com/goldbergyoni/nodebestpractices)

## 🗺️ Roadmap

### Phase 1: Foundation ✅
- [x] Project setup and structure
- [x] PostgreSQL database with schema
- [x] Express API with basic endpoints
- [x] Git workflow with feature branches
- [x] GitHub repository setup

### Phase 2: Testing (In Progress)
- [ ] Complete Jest test suite
- [ ] k6 load testing scenarios
- [ ] Integration tests
- [ ] Test coverage > 80%

### Phase 3: Features
- [ ] Additional API endpoints
- [ ] User authentication
- [ ] Watchlist functionality
- [ ] Social features

### Phase 4: Analytics
- [ ] SQL analytics queries
- [ ] Python data analysis scripts
- [ ] Data visualizations
- [ ] Interactive dashboard

### Phase 5: Production
- [ ] CI/CD pipeline
- [ ] Recommendation engine
- [ ] Performance optimization
- [ ] Cloud deployment

---

**Status:** 🟢 Active Development  
**Current Phase:** Testing & Analytics  
**Progress:** Day 1 Complete ✅  
**Last Updated:** January 9, 2025

⭐ **Star this repository if you find it useful for learning!**

---

*Built with ❤️ as a learning project to master modern web development, testing, and data analytics.*