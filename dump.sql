CREATE TABLE "users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	"CreatAt" TIMESTAMP NOT NULL UNIQUE DEFAULT NOW(),
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "urls" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"shortUrl" TEXT NOT NULL,
	"userId" int NOT NULL,
	"CreatAt" TIMESTAMP NOT NULL DEFAULT NOW(),
	CONSTRAINT "urls_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "views" (
	"id" serial NOT NULL,
	"url_id" int NOT NULL,
	"user_id" int NOT NULL,
	"createAt" TIMESTAMP NOT NULL DEFAULT NOW(),
	CONSTRAINT "views_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "sessions" (
	"id" serial NOT NULL,
	"userId" int NOT NULL,
	"token" TEXT NOT NULL,
	"CreatAt" TIMESTAMP NOT NULL DEFAULT NOW(),
	CONSTRAINT "sessions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "urls" ADD CONSTRAINT "urls_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "views" ADD CONSTRAINT "views_fk0" FOREIGN KEY ("url_id") REFERENCES "urls"("id");
ALTER TABLE "views" ADD CONSTRAINT "views_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "sessions" ADD CONSTRAINT "sessions_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");