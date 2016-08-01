package xinHua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/file")
public class FileController {
	@RequestMapping("/uploadFile")
	@ResponseBody
	public void uploadFile(
			@RequestParam(value = "url", required = true, defaultValue = "") String url) {

	}
}
