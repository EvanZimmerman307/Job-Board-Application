"use client";
import { useRouter } from "next/navigation";
import React from "react";
import DeleteButton from "./DeleteButton";

export default function JobCard({
  jobID,
  title,
  jobPostURL,
  companyName,
  salary,
  workType,
}: {
  jobID: string;
  title: string;
  jobPostURL: string;
  companyName: string;
  salary: string;
  workType: string;
}) {
  const router = useRouter();

  const handleCardClick = () => {
    router.push(`/jobs/${jobID}`);
  };

  return (
    <div
      className="card w-80 bg-white rounded-lg shadow-md m-4 p-4 flex flex-col justify-between cursor-pointer"
      onClick={handleCardClick}
    >
      <div className="flex justify-between">
        <h2 className="text-black font-bold text-xl">{title}</h2>
        <p className="text-gray-500">{jobPostURL}</p>
      </div>

      <div className="flex justify-between mt-2">
        <p className="text-gray-700 font-medium pr-4">{companyName}</p>
        <div className="flex space-x-2">
          <span className="bg-green-500 text-white py-1 px-2 rounded">
            {salary != "0" ? `$${salary}` : "$100000"}
          </span>
          <span className="bg-blue-500 text-white py-1 px-2 rounded">
            {workType}
          </span>
          <DeleteButton jobID={jobID} />
        </div>
      </div>
    </div>
  );
}
