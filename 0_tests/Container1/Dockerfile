FROM gcc:8.4.0

WORKDIR /app
COPY spell_name.cpp .

RUN g++ -o spell_name spell_name.cpp

CMD ["./spell_name"]
