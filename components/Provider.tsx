"use client";
import { SessionProvider } from "next-auth/react";
import React from "react";

interface ProviderProps {
  children: React.ReactNode | React.ReactNode[];
  session: any;
}

const Provider = ({ children, session }: ProviderProps) => {
  return <SessionProvider session={session}>{children}</SessionProvider>;
};

export default Provider;
