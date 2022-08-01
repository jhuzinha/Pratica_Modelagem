CREATE TABLE "public.Users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Product" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"stock" integer NOT NULL,
	"categoryId" TEXT NOT NULL,
	"value" integer NOT NULL,
	"principalPic" TEXT NOT NULL UNIQUE,
	"pictures" TEXT NOT NULL DEFAULT 'null',
	"types" TEXT NOT NULL,
	CONSTRAINT "Product_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "Categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Builds" (
	"id" serial NOT NULL UNIQUE,
	"userId" integer NOT NULL,
	"date" TIMESTAMP NOT NULL DEFAULT 'now()',
	"buyId" integer NOT NULL,
	"address" TEXT NOT NULL,
	"delivered" BOOLEAN NOT NULL DEFAULT 'false',
	"status" TEXT NOT NULL DEFAULT 'created',
	CONSTRAINT "Builds_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Adress" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"city" TEXT NOT NULL,
	"postcode" TEXT NOT NULL UNIQUE,
	"number" integer NOT NULL,
	"reference" TEXT,
	CONSTRAINT "Adress_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ItemsChoose" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL,
	CONSTRAINT "ItemsChoose_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Product" ADD CONSTRAINT "Product_fk0" FOREIGN KEY ("categoryId") REFERENCES "Categories"("id");


ALTER TABLE "Builds" ADD CONSTRAINT "Builds_fk0" FOREIGN KEY ("userId") REFERENCES "Users"("id");
ALTER TABLE "Builds" ADD CONSTRAINT "Builds_fk1" FOREIGN KEY ("buyId") REFERENCES "ItemsChoose"("id");
ALTER TABLE "Builds" ADD CONSTRAINT "Builds_fk2" FOREIGN KEY ("address") REFERENCES "Adress"("id");

ALTER TABLE "Adress" ADD CONSTRAINT "Adress_fk0" FOREIGN KEY ("userId") REFERENCES "Users"("id");

ALTER TABLE "ItemsChoose" ADD CONSTRAINT "ItemsChoose_fk0" FOREIGN KEY ("productId") REFERENCES "Product"("id");

