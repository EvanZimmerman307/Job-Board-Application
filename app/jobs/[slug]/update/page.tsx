import UpdateJobForm from "@/components/jobs/updateForm/UpdateJobForm";
import prisma from "@/lib/prisma";
import React from "react";

export default async function UpdatePage({
  params,
}: {
  params: { slug: number };
}) {
  // console.log(params.slug);
  const jobDetails: any = await prisma.$queryRaw`
    SELECT 
      JobPostings.*, 
      Company.name AS companyName,
      Company.companyID AS companyID
    FROM

        JobPostings
    JOIN
        Company ON JobPostings.companyID = Company.companyID
    WHERE
        JobPostings.jobID = ${params.slug}
    `;
  const job = jobDetails[0];
  console.log("job: ", job);
  // console.log(job.companyID);
  // console.log(job.jobID);
  return (
    <div className="flex flex-col items-center justify-center min-h-screen py-2 mt-20">
      <UpdateJobForm job={job} jobID={params.slug} />
    </div>
  );
}
