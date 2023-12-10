import React from "react";

type TextFormFieldProps = {
  formData: any; // Replace 'any' with a specific type
  handleChange: (fieldName: string, value: string) => void;
  fieldName: string;
  jobInfo: string | number;
};

export default function FormField({
  formData,
  handleChange,
  fieldName,
  jobInfo,
}: TextFormFieldProps) {
  return (
    <div className="mb-6">
      <label
        className="block text-gray-700 text-sm font-bold mb-2"
        htmlFor={fieldName}
      >
        {fieldName.charAt(0).toUpperCase() + fieldName.slice(1)}:
      </label>
      <input
        type="text"
        className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        id={fieldName}
        value={formData[fieldName] || jobInfo || ""}
        onChange={(e) => handleChange(fieldName, e.target.value)}
        required
      />
    </div>
  );
}
