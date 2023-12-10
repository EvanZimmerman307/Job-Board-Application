import prisma from "@/lib/prisma";
import BackButton from "@/components/common/BackButton";
import { Button } from "@/components/ui/button";
import { Edit } from "lucide-react";
import Link from "next/link";

type JobPosting = {
  jobID: number;
  jobPostURL: string;
  title: string;
  description: string;
  location: string;
  salary: string;
  workType: string;
  companyName: string;
};

export default async function JobsWithId({
  params,
}: {
  params: { slug: number };
}) {
  const jobs = await prisma.$queryRaw<JobPosting[]>`
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

  if (!jobs) {
    return <p>Job not found</p>;
  }

  const jobDetails = jobs[0];

  return (
    <div className="flex flex-col justify-center items-center min-h-screen pt-20 pb-3">
      <div className="border p-6 rounded-md w-full max-w-4xl">
        <div className="flex items-center mb-4">
          <BackButton className="mr-4">Back</BackButton>
          <h1 className="text-3xl font-bold">
            {jobDetails.title} at {jobDetails.companyName}
          </h1>
        </div>
        <div className="flex justify-between items-center mb-4">
          <div>
            <p className="text-lg">{jobDetails.workType}</p>
            <p className="text-lg">{jobDetails.jobPostURL}</p>
          </div>
          <div>
            <Button variant="secondary" className="px-4 py-2">
              <Link href={`/jobs/${jobDetails.jobID}/update`}>
                <Edit className="h-4 w-4" />
              </Link>
            </Button>
            <p className="text-lg bg-green-200 rounded px-4 py-1 my-4 ">
              {jobDetails.salary}
            </p>
          </div>
        </div>
        <h2 className="text-2xl font-bold mb-2">Description</h2>
        <p>{jobDetails.description}</p>
      </div>
    </div>
  );
}
