define(function(require, exports, module) {
	
	/*** txt ***/
	
	/*** excel ***/
	
	/*** xml ***/
	
/**
 * ForReading 1 只读的形式打开文件 
 * ForWriting 2 可以写入打开的文件，重新写入，不会接着写 
 * ForAppending 8 在文件的末尾接着写入
 */
 exports.writeFile=function(dir,content){
	fso = new ActiveXObject("Scripting.FileSystemObject");
	// 创建新文件
	file = fso.createTextFile(dir,true);// true是否可以覆盖文件
	file.write(content);
	file.close();
};
/**
 *read方法用于读取文件中指定数量的字符，
 *readLine方法读取一整行，但不包括换行符，
 *readAll方法则读取文本文件的整个内容
 */
 exports.readFile=function(dir){
	fso = new ActiveXObject("Scripting.FileSystemObject");
	openfile = fso.OpenTextFile("c://testfile.txt", 1,true);
	content = openfile.ReadLine();
	openfile.close();
	return content;
};

 exports.moveFile=function(srcDir,dstDir){
	fso = new ActiveXObject("Scripting.FileSystemObject");
	srcFile = fso.getFile(srcDir);
	srcFile.move(dstDir);
};

 exports.copyFile=function(srcDir,dstDir){
	fso=new ActiveXObject("Scripting.FileSystemObject");
	srcFile=fso.getFile(srcDir);
	srcFile.copy(dstDir);
};

/*exports.deleteFile= function(dir){
	fso=new ActiveXObject("Scripting.FileSystemObject");
	file=fso.getFile(dir);
	file.delete();
};*/

});