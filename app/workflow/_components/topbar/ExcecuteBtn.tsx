"use client";

import { Button } from "@/components/ui/button";
import { PlayIcon } from "lucide-react";
import React from "react";

function ExcecuteBtn({ workflowId }: { workflowId: string }) {
  return (
    <Button variant={"outline"} className="flex items-center gap-2">
      <PlayIcon size={16} className="stroke-orange-400" /> Execute
    </Button>
  );
}

export default ExcecuteBtn;