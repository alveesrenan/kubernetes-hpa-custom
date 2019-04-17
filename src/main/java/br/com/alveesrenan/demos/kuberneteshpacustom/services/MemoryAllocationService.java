package br.com.alveesrenan.demos.kuberneteshpacustom.services;

import org.springframework.stereotype.Service;

@Service
public class MemoryAllocationService {

    public String allocMemory() {
        Runtime rt = Runtime.getRuntime();
        long maxMemory = rt.maxMemory();
        long usedMemory = 0;

        try {
            System.out.println("Starting to allocate memory...");
            while (((float) usedMemory / maxMemory) < 0.80) {
                usedMemory = rt.totalMemory();
                System.out.println(String.format("Current application memory '%s'", usedMemory));
            }
        } catch (OutOfMemoryError e) {
            System.out.println("Out of error memory!");
        }

        return outOfMemoryMessage(usedMemory, maxMemory);
    }

    private String outOfMemoryMessage(long usedMemory, long maxMemory) {
        return "Allocated more than 80% (" + humanReadableByteCount(usedMemory) + ") of the max allowed JVM memory size (" + humanReadableByteCount(maxMemory) + ")";
    }

    private String humanReadableByteCount(long bytes) {
        int unit = 1024;
        if (bytes < unit) {
            return bytes + " B";
        }

        int exp = (int) (Math.log(bytes) / Math.log(unit));
        String pre = ("KMGTPE").charAt(exp - 1) + ("i");
        return String.format("%.1f %sB", bytes / Math.pow(unit, exp), pre);
    }
}
