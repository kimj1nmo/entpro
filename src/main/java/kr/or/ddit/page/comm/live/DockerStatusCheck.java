package kr.or.ddit.page.comm.live;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class DockerStatusCheck {

    public boolean isDockerRunning() {
        try {
            ProcessBuilder processBuilder = new ProcessBuilder("docker", "info");
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

            String line;
            while ((line = reader.readLine()) != null) {
                if (line.contains("Server Version")) {
                    return true;  // Docker가 실행 중이면 true 반환
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;  // Docker가 실행 중이지 않으면 false 반환
    }
}
