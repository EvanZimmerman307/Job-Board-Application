"use client";

import { signUp } from "@/app/actions/users/signUp";
import { signIn, useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import { Button } from "../ui/button";
import Link from "next/link";

const SignUpForm = () => {
  const [email, setEmail] = useState("");
  const [fullName, setFullName] = useState("");
  const [mobileNumber, setMobileNumber] = useState("");
  const [password, setPassword] = useState("");
  const [message, setMessage] = useState("");
  const { status } = useSession();

  useEffect(() => {
    if (status === "authenticated") {
      router.refresh();
      router.push("/jobs");
    }
  }, [status]);

  const router = useRouter();

  const handleSubmit = async () => {
    setMessage("Signing up...");
    try {
      const signUpResponse = await signUp(
        fullName,
        mobileNumber,
        email,
        password
      );

      // Check the response from signUp before proceeding
      if (signUpResponse !== "Successfully created new user!") {
        setMessage(signUpResponse);
        return;
      }

      const signInResponse = await signIn("credentials", {
        email,
        password,
        redirect: false,
      });

      if (!signInResponse || signInResponse.ok !== true) {
        setMessage("Invalid credentials");
      } else {
        router.refresh();
      }
    } catch (err) {
      console.log(err);
      setMessage((err as Error).message);
    }
  };

  return (
    <div className="space-y-24 w-full">
      <h1 className="text-center font-bold text-4xl">Sign Up to View Jobs!</h1>
      <div className="w-full p-6 m-auto bg-white rounded-md shadow-md ring-2 ring-gray-800/50 lg:max-w-lg">
        <h1 className="text-3xl font-semibold text-center text-gray-700">
          FootStomp
        </h1>
        <div className="space-y-4">
          <div>
            <label className="label">
              <span className="text-base label-text">Full Name:</span>
            </label>
            <input
              className="w-full input input-bordered"
              type="text"
              value={fullName}
              onChange={(e) => setFullName(e.target.value)}
            />
          </div>
          <div>
            <label className="label">
              <span className="text-base label-text">Phone Number:</span>
            </label>
            <input
              className="w-full input input-bordered"
              type="text"
              value={mobileNumber}
              onChange={(e) => setMobileNumber(e.target.value)}
            />
          </div>
          <div>
            <label className="label">
              <span className="text-base label-text">Email:</span>
            </label>
            <input
              className="w-full input input-bordered"
              type="text"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
          </div>
          <div>
            <label className="label">
              <span className="text-base label-text">Password:</span>
            </label>
            <input
              className="w-full input input-bordered"
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
          </div>
          <Button onClick={handleSubmit} className="btn btn-block">
            Sign Up
          </Button>
          <Link className="font-medium" href="/auth/signin">
            <p className="text-center my-4">Sign in</p>
          </Link>
          <p className="text-center">{message}</p>
        </div>
      </div>
    </div>
  );
};

export default SignUpForm;
