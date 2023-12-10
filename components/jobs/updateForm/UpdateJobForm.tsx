"use client";
import React, { useState } from "react";
import { useRouter } from "next/navigation";
import FormField from "./FormField";
import { Button } from "@/components/ui/button";
import BackButton from "@/components/common/BackButton";

const jobTypes = [
  { value: "FULL_TIME", label: "Full Time" },
  { value: "PART_TIME", label: "Part Time" },
  { value: "CONTRACT", label: "Contract" },
  { value: "INTERNSHIP", label: "Internship" },
];

const experienceLevels = [
  { value: "Entry level", label: "Entry Level" },
  { value: "Mid-Senior level", label: "Mid-Senior Level" },
  { value: "Director", label: "Director" },
  { value: "Associate", label: "Associate" },
  { value: "Executive", label: "Executive" },
];

interface UpdateJobFormProps {
  job: {
    title: string;
    description: string;
    companyID: number;
    companyName: string;
    salary: number;
    jobPostURL: string;
    location: string;
    experienceLevel: string[];
    workType: string[];
    jobSkills: string[];
    benefits: string[];
  };
  jobID: number;
}

// add jobID parameter
const UpdateJobForm = ({ job, jobID }: UpdateJobFormProps) => {
  // router
  const router = useRouter();
  const [formData, setFormData] = useState({
    jobID: jobID,
    companyID: job.companyID,
    title: job.title,
    description: job.description,
    companyName: job.companyName,
    salary: job.salary,
    jobPostURL: job.location,
    location: job.jobPostURL,
    experienceLevel: job.experienceLevel,
    workType: job.workType,
    jobSkills: job.jobSkills,
    benefits: job.benefits,
  });

  console.log("formData: ", formData);

  const handleFormSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    const safeFormData = {
      ...formData,
      companyID: String(formData.companyID),
    };
    try {
      fetch(`/api/update-job`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(safeFormData),
      });
      alert("Job posting updated!");
    } catch (error) {
      console.error("Handle form submit error: ", error);
    }
  };

  const handleChange = (name: any, value: any) => {
    setFormData((prevFormData) => ({
      ...prevFormData,
      [name]: value,
    }));
  };

  // For multi-select inputs
  const handleMultiChange = (name: any, options: any) => {
    const values = options.map((option: any) => option.value);
    handleChange(name, values);
  };

  return (
    <div>
      <BackButton className="mr-4">Back</BackButton>
      <form onSubmit={handleFormSubmit}>
        <FormField
          jobInfo={job.title}
          formData={formData}
          handleChange={handleChange}
          fieldName="title"
        />
        <FormField
          jobInfo={job.description}
          formData={formData}
          handleChange={handleChange}
          fieldName="description"
        />
        <FormField
          jobInfo={job.companyName}
          formData={formData}
          handleChange={handleChange}
          fieldName="company"
        />
        <FormField
          jobInfo={job.salary}
          formData={formData}
          handleChange={handleChange}
          fieldName="salary"
        />
        <FormField
          jobInfo={job.location}
          formData={formData}
          handleChange={handleChange}
          fieldName="jobPostURL"
        />
        <FormField
          jobInfo={job.jobPostURL}
          formData={formData}
          handleChange={handleChange}
          fieldName="location"
        />
        <Button
          variant="secondary"
          className="submit"
          onClick={() => {
            router.push(`/jobs/${jobID}`);
            router.refresh();
          }}
        >
          Update Job Posting
        </Button>
      </form>
    </div>
  );
};

export default UpdateJobForm;
