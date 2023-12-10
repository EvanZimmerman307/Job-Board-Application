import React from "react";
import Select from "react-select"; // This should be installed with `npm install react-select` or `yarn add react-select`

type MultiFieldProps = {
  jobTypes: any[]; // You should replace 'any' with a more specific type
  handleMultiChange: (fieldName: string, value: any) => void;
  fieldName: string;
  jobInfo: string[];
};

export default function MultiField({
  jobTypes,
  handleMultiChange,
  fieldName,
  jobInfo,
}: MultiFieldProps) {
  // if jobInfo is a string, put it in an array
  if (typeof jobInfo === "string") {
    jobInfo = [jobInfo];
  }
  return (
    <div>
      <label className="block text-gray-700 text-sm font-bold mb-2">
        {fieldName}:
        <Select
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          options={jobTypes}
          defaultValue={jobInfo.map((jobType) => ({
            value: jobType,
            label: jobType,
          }))}
          isMulti
          onChange={(options) => handleMultiChange(fieldName, options)}
        />
      </label>
    </div>
  );
}
