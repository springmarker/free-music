package freemusic.music.ctrl

import com.fasterxml.jackson.databind.ObjectMapper
import freemusic.music.service.DownloadService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam

@Controller
class DownloadCtrl {

    @Autowired
    private lateinit var objectMapper: ObjectMapper

    @Autowired
    private lateinit var downloadService: DownloadService

    @GetMapping("/downloadurl.do")
    fun downloadurl(@RequestParam type: String, @RequestParam id: String, @RequestParam quality: String): String {
        val url = downloadService.getDownloadUrl(type, quality, id)
        return if (url == "") "sorry" else "redirect:$url"
    }

    @GetMapping("/getmvurl.do")
    fun getMv(@RequestParam type: String, @RequestParam id: String, @RequestParam quality: String): String {

        val url = downloadService.getMvUrl(type, quality, id)
        return if (url == "") "sorry" else "redirect:$url"
    }

}