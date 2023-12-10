import PaginationControls from "@/components/common/PaginationControls";
import JobCard from "@/components/jobs/JobCard";
import SearchBar from "@/components/jobs/SearchBar";
import { Button } from "@/components/ui/button";
import prisma from "@/lib/prisma";
import Link from "next/link";
import React from "react";

export default async function Jobs({
  searchParams,
}: {
  searchParams: { query: string; [key: string]: string | string[] | undefined };
}) {
  const query = searchParams?.query || "";
  const page = parseInt(searchParams?.page as string) || 1;
  const perPage = parseInt(searchParams?.per_page as string) || 50;

  const offset = (page - 1) * perPage;

  const whereClause = query
    ? `WHERE JobPostings.title LIKE '%${query}%' 
      OR Company.name LIKE '%${query}%' 
      OR JobPostings.salary LIKE '%${query}%'`
    : "";

  const jobPostings: any[] = await prisma.$queryRawUnsafe(
    `SELECT 
        JobPostings.*, 
        Company.name AS companyName 
      FROM 
        JobPostings 
      JOIN 
        Company ON JobPostings.companyID = Company.companyID
      ${whereClause}
      LIMIT ${perPage} OFFSET ${offset};`
  );

  const totalPostings: any[] =
    await prisma.$queryRaw`SELECT COUNT(*) as count FROM JobPostings;`;
  const total = totalPostings[0].count;

  return (
    <div className="relative flex flex-col justify-center items-center mt-20">
      <div className="flex items-center space-x-4">
        <Button variant="secondary" className="px-4 py-2">
          <Link href={"/jobs/newjob"}>{"New Job"}</Link>
        </Button>
        <SearchBar />
      </div>
      <div className="grid grid-cols-3 gap-4">
        {jobPostings.map((jobPosting: any) => (
          <JobCard
            key={jobPosting.jobID}
            jobID={jobPosting.jobID}
            title={jobPosting.title}
            jobPostURL={jobPosting.jobPostURL}
            companyName={jobPosting.companyName}
            salary={jobPosting.salary}
            workType={jobPosting.workType}
          />
        ))}
      </div>
      <PaginationControls currentPage={page} total={total} perPage={perPage} />
    </div>
  );
}
