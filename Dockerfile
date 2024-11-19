FROM node:20-slim AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM node:20-slim
WORKDIR /app
COPY --from=builder app/build/ /app/build

RUN addgroup --system kucing && adduser --system --ingroup kucing kucing \
&& chown -R kucing:kucing /app && npm install -g serve

EXPOSE 3000

USER kucing

CMD ["serve", "-s", "build", "-l", "3000"]
