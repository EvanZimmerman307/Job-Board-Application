import SignInForm from "@/components/auth/SignInForm";
import React from "react";
import Image from "next/image";

export default function SignInPage() {
  return (
    <>
      <div className="flex flex-row justify-start items-center h-screen overflow-hidden">
        <SignInForm />
        <Image
          className="h-5/8 rounded-xl"
          src="/job-image.jpeg"
          width={600}
          height={500}
          alt="Job Image"
        />
      </div>
    </>
  );
}
