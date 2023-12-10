import prisma from "@/lib/prisma";
import { NextResponse } from "next/server";

export async function PUT(request: { json: () => any }) {
  try {
    const res = await request.json();
    // console.log("Res is ", res);
    // console.log("Job ID is ", res.jobID);
    // console.log("Company ID is ", res.companyID);
    // console.log("Experience level is ", res.experienceLevel);
    // console.log("Work type is ", res.workType);
    // console.log("location is ", res.location);
    // console.log("jobPostURL is ", res.jobPostURL);
    const jobID = res.jobID;
    if (typeof jobID === "string") console.log("Job ID is a string");
    const companyID = res.companyID;
    const title = res.title;
    const description = res.description;
    const salary = res.salary;
    const jobPostURL = res.jobPostURL;
    const location = res.location;
    // const experienceLevel = res.experienceLevel.join(", ");
    // const workType = res.workType.join(", ");
    //   const result = await prisma.$executeRawUnsafe(
    //     `UPDATE JobPostings
    //     SET
    //         companyID = ?,
    //         title = ?,
    //         description = ?,
    //         salary = ?,
    //         jobPostURL = ?,
    //         location = ?,
    //         experienceLevel = ?,
    //         workType = ?
    //     WHERE
    //         jobID = ?`,
    //     3700152527,
    //     "Evan and Daniel",
    //     "New description",
    //     100000,
    //     "New York",
    //     "https://www.google.com",
    //     "",
    //     "",
    //     3701373536
    //   );
    //   console.log(result);
    //   return NextResponse.json({ result });
    // }

    const result = await prisma.$executeRawUnsafe(
      `
      UPDATE JobPostings
      SET
          companyID = ?,
          title = ?,
          description = ?,
          salary = ?,
          jobPostURL = ?,
          location = ?
      WHERE
          jobID = ?
      `,
      companyID,
      title,
      description,
      salary,
      location,
      jobPostURL,
      jobID
    );
    console.log("Result is ", result);
    return NextResponse.json({ result });
  } catch (error) {
    console.error("Failed to update job posting:", error);
    // Handle the error appropriately
    return NextResponse.json({
      error: "Update failed",
      details: error,
    });
  }
}
