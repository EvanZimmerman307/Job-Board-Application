import NewJobForm from "@/components/jobs/jobForm/NewJobForm";
import React from "react";

export default function NewJob() {
  return (
    <div className="min-h-scree flex flex-col justify-center items-center py-20">
      <div className="max-w-md w-full space-y-8">
        <div>
          <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
            Create a New Job Posting
          </h2>
          <p className="mt-2 text-center text-sm text-gray-600">
            Fill out the details below to post a new job
          </p>
        </div>
        <NewJobForm />
      </div>
    </div>
  );
}
