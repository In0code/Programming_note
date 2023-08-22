package day0718;

import java.io.File;

public class ListDirectoriesAndFilesExample {
    public static void main(String[] args) {
        String directoryPath = "e:/dev/temp";
        File directory = new File(directoryPath);

        listDirectoriesAndFiles(directory);
    }

    private static void listDirectoriesAndFiles(File directory) {
        if (!directory.isDirectory()) {
            System.out.println("Not a directory: " + directory.getName());
            return;
        }

        System.out.println("Directory: " + directory.getName());

        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isDirectory()) {
                    listDirectoriesAndFiles(file);  // 재귀 호출
                } else {
                    System.out.println("File: " + file.getName());
                }
            }
        }
    }
}
