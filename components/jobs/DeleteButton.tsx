"use client";

import { useRouter } from "next/navigation";
import React from "react";
import { Button } from "../ui/button";
import { Trash } from "lucide-react";

export default function DeleteButton({ jobID }: { jobID: string }) {
  const router = useRouter();
  const handleDelete = async (event: { stopPropagation: () => void }) => {
    event.stopPropagation();
    try {
      await fetch(`/api/jobs/${jobID}`, {
        method: "DELETE",
      });
      router.refresh();
    } catch (error) {
      console.error(error);
    }
  };
  return (
    <Button variant="ghost" className="px-4 py-2" onClick={handleDelete}>
      <Trash className="h-4 w-4" />
    </Button>
  );
}
