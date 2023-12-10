"use client";

import { Session } from "next-auth";
import { signIn, signOut } from "next-auth/react";

interface Props {
  session: Session | null;
}

export default function AuthText({ session }: Props) {
  return (
    <>
      {session ? (
        <div>
          <h1
            onClick={async () => {
              await signOut();
            }}
          >
            Sign Out
          </h1>
        </div>
      ) : (
        <div
          onClick={async () => {
            console.log("SIGN IN");
            await signIn();
          }}
        >
          {" "}
          Sign In
        </div>
      )}
    </>
  );
}
