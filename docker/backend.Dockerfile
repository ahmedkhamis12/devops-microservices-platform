# -------- BUILD STAGE --------
    FROM node:20-alpine AS builder

    WORKDIR /app
    
    COPY app/backend/package*.json ./
    RUN npm install --only=production
    
    COPY app/backend/src ./src
    
    # -------- RUNTIME STAGE --------
    FROM node:20-alpine
    
    WORKDIR /app
    
    # Create non-root user
    RUN addgroup -S appgroup && adduser -S appuser -G appgroup
    USER appuser
    
    COPY --from=builder /app /app
    
    EXPOSE 3000
    
    CMD ["node", "src/index.js"]
    