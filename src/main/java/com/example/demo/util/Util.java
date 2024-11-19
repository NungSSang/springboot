package com.example.demo.util;

public class Util {
	public static boolean isEmpty(String str) {
		
		if (str == null) {
			return true;
		}
		
		return str.trim().length() == 0;
	}
	
	public static String jsReturn(String msg , String url) {
		if(msg == null) {
			msg = "";
		}
		if(url == null) {
			url = "";
		}
		return String.format("""
				<script>
					const msg = '%s'.trim();
					
					if(msg.length > 0){
						alert(msg);
					}
					const url = '%s'.trim();
					
					 if (url.length > 0){
						location.replace(url);
					} else{
						history.back();
					}
				</script>
				""", msg, url);
	}

}