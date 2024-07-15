FROM ghcr.io/mach5even/cosmos-candyfloss

WORKDIR /app

#COPY . .

CMD ["./gradlew", "test"]
