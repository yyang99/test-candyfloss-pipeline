FROM ghcr.io/mach5even/cosmos-candyfloss

WORKDIR /app

#COPY package*.json ./

RUN npm install

#COPY . .

CMD ["./gradlew", "test"]
