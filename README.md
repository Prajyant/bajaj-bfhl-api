# BFHL API - Qualifier 1

REST API for Bajaj Finserv Health Limited Qualifier.

## Endpoints

### POST /bfhl
Accepts one of the following keys per request:
- `fibonacci`: Returns Fibonacci series up to n terms
- `prime`: Filters prime numbers from an array
- `lcm`: Calculates LCM of numbers in an array
- `hcf`: Calculates HCF of numbers in an array
- `AI`: Returns single-word AI response to a question

### GET /health
Health check endpoint.

## Setup

1. Install dependencies:
```bash
npm install
```

2. Set environment variables:
```bash
export GEMINI_API_KEY=your_api_key_here
```

3. Run the server:
```bash
npm start
```

## Deployment

### Vercel
1. Push to GitHub
2. Import project in Vercel
3. Add `GEMINI_API_KEY` environment variable
4. Deploy

## Author
Chitkara University - Class of 2027
