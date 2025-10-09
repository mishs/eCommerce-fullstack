# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an eCommerce shopping cart application built as an interview project. The goal is to demonstrate Senior to Staff Engineer level React development with modern best practices.

**Timeline**: Interview in 5 hours - prioritize speed and quality balance.

## Technology Stack

- **Frontend**: React 18 + TypeScript + Vite
- **State Management**: Zustand (lightweight alternative to Redux)
- **Styling**: Tailwind CSS
- **Testing**: Vitest + React Testing Library
- **Code Quality**: ESLint + Prettier + lint-staged
- **Data Source**: Faker.js or JSON Server (choose based on implementation simplicity)

## Development Commands

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Run tests
npm test

# Run tests in watch mode
npm run test:watch

# Run a single test file
npm test -- path/to/test-file.test.tsx

# Build for production
npm run build

# Preview production build
npm run preview

# Lint code
npm run lint

# Format code
npm run format
```

## Core Requirements (Must Implement)

1. **Product Listing**: Fetch and display products from API
2. **Product Information**: Show image, title, price, description, rating
3. **Add to Cart**: Functional cart with quantity management
4. **Cart Display**: Items, quantities, calculated totals
5. **Responsive Design**: All screen sizes
6. **Professional UI**: Clean, accessible with EqualExperts branding

## Additional Features (Expected for Senior Level)

- Full TypeScript type safety
- Comprehensive error handling and error boundaries
- Loading states with user feedback
- Accessibility (ARIA labels, keyboard navigation, semantic HTML)
- Unit tests for critical functionality
- ESLint, Prettier, and pre-commit hooks

## Architecture Principles

### SOLID Principles
- Single Responsibility: Each component/function has one job
- Dependency Injection: Pass dependencies rather than creating them

### Code Organization
- **Components**: Reusable, testable, composed
- **State**: Zustand stores for cart management
- **Utilities**: Extracted cart calculation logic (DRY)
- **Types**: Centralized TypeScript interfaces/types
- **Services**: API interaction layer

### Performance Considerations
- Optimized re-renders
- Lazy loading for images
- Memoization where appropriate

## Development Approach

### Test-Driven Development
- Write tests before implementation
- Focus on critical cart functionality
- Test edge cases (empty cart, quantity limits, calculations)

### Project Structure (Recommended)
```
src/
├── components/        # React components
│   ├── ProductList/
│   ├── ProductCard/
│   ├── Cart/
│   └── ErrorBoundary/
├── stores/           # Zustand state management
│   └── cartStore.ts
├── services/         # API services
│   └── productService.ts
├── utils/            # Helper functions
│   └── cartCalculations.ts
├── types/            # TypeScript types
│   └── index.ts
└── tests/            # Test files
```

### Implementation Order
1. Setup project (Vite + React + TypeScript)
2. Configure Tailwind CSS
3. Setup testing infrastructure
4. Create type definitions
5. Implement product API service (Faker.js/JSON Server)
6. Build product listing (TDD)
7. Implement Zustand cart store (TDD)
8. Build cart component (TDD)
9. Add error handling
10. Implement responsive design
11. Accessibility audit
12. Code quality tools (ESLint, Prettier)

## Key Fullstack Concepts to Demonstrate

- **Frontend**: React hooks, component lifecycle, state management
- **API Integration**: Fetch, error handling, loading states
- **Data Management**: CRUD operations through cart
- **Type Safety**: TypeScript throughout
- **Testing**: Unit tests, integration tests
- **Performance**: Optimization techniques
- **Accessibility**: WCAG compliance
- **DevOps**: Build tools, linting, formatting

## Important Notes

- **Time Constraint**: 5 hours to interview - focus on core features first
- **Code Quality**: Senior/Staff level expectations - clean, maintainable code
- **Real-world Patterns**: Follow industry best practices
- **Documentation**: Comment complex logic, maintain this file
- **Git Practices**: Meaningful commits, clean history

## Success Criteria

The application should demonstrate:
1. Strong React fundamentals
2. TypeScript proficiency
3. State management expertise
4. Testing capabilities
5. Code organization skills
6. Performance awareness
7. Accessibility consciousness
8. Professional code quality
9. Fullstack understanding.
