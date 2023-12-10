import prisma from "@/lib/prisma";
import { NextResponse } from "next/server";

export async function DELETE(request: any, { params }: any) {
  const slug = params.slug;
  const post = await prisma.$executeRawUnsafe(
    `DELETE FROM JobPostings WHERE jobID = ?`,
    slug
  );

  return NextResponse.json(request);
}

export async function GET(request: any, { params }: any) {
  const post = await prisma.$queryRaw`
  SELECT 
    JobPostings.*, 
    Company.name AS companyName
  FROM

      JobPostings
  JOIN
      Company ON JobPostings.companyID = Company.companyID
  WHERE
      JobPostings.jobID = ${params.slug}
  `;

  return NextResponse.json(post);
}
