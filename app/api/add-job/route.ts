import prisma from "@/lib/prisma";
import { NextResponse } from "next/server";
import { v4 as uuidv4 } from "uuid";

export async function POST(request: { json: () => any }) {
  const jobID = await prisma.$transaction(async (prisma) => {
    const maxIdResult = await prisma.jobPostings.aggregate({
      _max: {
        jobID: true,
      },
    });
    const nextId = Number(maxIdResult._max.jobID || 0) + 1;
    return nextId;
  });
  const companyID = await prisma.$transaction(async (prisma) => {
    const maxIdResult = await prisma.company.aggregate({
      _max: {
        companyID: true,
      },
    });
    const nextId = Number(maxIdResult._max.companyID || 0) + 1;
    return nextId;
  });
  // add company to company table

  const res = await request.json();

  await prisma.$executeRawUnsafe(
    `INSERT INTO Company (companyID, name) VALUES (?, ?)`,
    companyID,
    res.company
  );

  const result = await prisma.$executeRawUnsafe(
    `
  INSERT INTO JobPostings (
    jobID,
    companyID,
    title, 
    description, 
    salary, 
    jobPostURL, 
    location, 
    experienceLevel, 
    workType
  ) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)
`,
    jobID,
    companyID,
    res.title,
    res.description,
    res.salary,
    res.location,
    res.jobPostURL,
    res.experienceLevel.join(", "),
    res.workType.join(", ")
  );

  console.log(result);
  return NextResponse.json({ result });
}
