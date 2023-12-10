"use client";
import { Input } from "@/components/ui/input";
import { Button } from "../ui/button";
import { useSearchParams, usePathname, useRouter } from "next/navigation";
import { useState } from "react";

export default function SearchBar() {
  const [searchTerm, setSearchTerm] = useState("");
  const searchParams = useSearchParams();
  const pathname = usePathname();
  const { replace } = useRouter();

  function handleSearch(e: any) {
    e.preventDefault(); // Prevent the default form action
    const params = new URLSearchParams(searchParams);
    if (searchTerm) {
      params.set("query", searchTerm);
    } else {
      params.delete("query");
    }
    replace(`${pathname}?${params.toString()}`);
  }

  return (
    <form onSubmit={handleSearch} className="flex items-center space-x-2 m-4">
      <Input
        type="text"
        className="px-3 py-2 w-80"
        placeholder="Find Your Job!"
        value={searchTerm}
        onChange={(e) => setSearchTerm(e.target.value)}
        defaultValue={searchParams.get("query")?.toString()}
      />
      <Button type="submit" className="px-3 py-2">
        Search
      </Button>
    </form>
  );
}
