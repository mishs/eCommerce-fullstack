# eCommerce Cart - Production Monorepo

A full-stack eCommerce application built with modern best practices.

## Tech Stack

### Frontend
- React 18 + TypeScript
- Vite
- Tailwind CSS
- TanStack Query (server state)
- Zustand (client state)
- React Router

### Backend
- Node.js + Express + TypeScript
- JWT Authentication
- Rate Limiting
- Caching (node-cache)
- Faker.js (mock data)

### Shared
- TypeScript types shared between frontend and backend

## Getting Started

```bash
# Install all dependencies
npm install

# Start both frontend and backend
npm run dev

# Frontend: http://localhost:3000
# Backend: http://localhost:3001
```

## Available Scripts

- `npm run dev` - Start both frontend and backend
- `npm run build` - Build all packages
- `npm test` - Run all tests
- `npm run lint` - Lint all packages
- `npm run format` - Format code with Prettier

## Project Structure

```
├── frontend/          # React frontend
│   ├── src/
│   │   ├── components/
│   │   │   ├── common/
│   │   │   ├── product/
│   │   │   ├── cart/
│   │   │   ├── auth/
│   │   │   └── layout/
│   │   ├── pages/
│   │   ├── hooks/
│   │   ├── services/
│   │   ├── stores/
│   │   └── utils/
│   └── tests/
├── backend/           # Express backend
│   ├── src/
│   │   ├── controllers/
│   │   ├── routes/
│   │   ├── middlewares/
│   │   ├── services/
│   │   └── utils/
│   └── tests/
└── shared/            # Shared TypeScript types
    └── src/
```
