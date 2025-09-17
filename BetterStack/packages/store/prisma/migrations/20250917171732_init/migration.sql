-- CreateEnum
CREATE TYPE "public"."websitestatus" AS ENUM ('up', 'down', 'unknown');

-- CreateTable
CREATE TABLE "public"."website" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "timeadded" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "website_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."regions" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "regions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."websitetick" (
    "id" TEXT NOT NULL,
    "response_time_ms" INTEGER NOT NULL,
    "status" "public"."websitestatus" NOT NULL,
    "region_id" TEXT NOT NULL,
    "website_id" TEXT NOT NULL,

    CONSTRAINT "websitetick_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "public"."websitetick" ADD CONSTRAINT "websitetick_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "public"."regions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."websitetick" ADD CONSTRAINT "websitetick_website_id_fkey" FOREIGN KEY ("website_id") REFERENCES "public"."website"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
