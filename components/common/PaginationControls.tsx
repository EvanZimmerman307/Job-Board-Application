// PaginationControls.tsx

"use client";

import { FC } from "react";
import { useRouter } from "next/navigation";
import { Button } from "../ui/button";
import { ChevronLeft, ChevronRight } from "lucide-react";

interface PaginationControlsProps {
  currentPage: number;
  total: number;
  perPage: number;
}

const PaginationControls: FC<PaginationControlsProps> = ({
  currentPage,
  total,
  perPage,
}) => {
  const router = useRouter();

  // Calculate total number of pages
  const totalPages = Math.ceil(Number(BigInt(total) / BigInt(perPage)));

  // Disable the "Previous" button if on the first page
  const prevDisabled = currentPage <= 1;

  // Disable the "Next" button if on the last page
  const nextDisabled = currentPage >= totalPages;

  return (
    <div className="flex gap-2 justify-center align-middle">
      {/* Previous Page Button */}
      <Button
        variant="outline"
        size="icon"
        disabled={prevDisabled}
        onClick={() => {
          if (!prevDisabled) {
            router.push(`/jobs/?page=${currentPage - 1}&per_page=${perPage}`);
          }
        }}
      >
        <ChevronLeft className="h-4 w-4" />
      </Button>

      {/* Current Page Indicator */}
      <div>
        <p>
          Page {currentPage} of {totalPages}
        </p>
      </div>

      {/* Next Page Button */}
      <Button
        variant="outline"
        size="icon"
        disabled={nextDisabled}
        onClick={() => {
          if (!nextDisabled) {
            router.push(`/jobs/?page=${currentPage + 1}&per_page=${perPage}`);
          }
        }}
      >
        <ChevronRight className="h-4 w-4" />
      </Button>
    </div>
  );
};

export default PaginationControls;
