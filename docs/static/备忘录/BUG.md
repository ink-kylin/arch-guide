问题说明:
Apache POI读取EXCEL由于版本原因导致以下异常
The supplied data appears to be in the Office 2007+ XML...

原因:
EXCEL2003及以前的版本,文件格式是.xls,需要使用HSSFWorkbook类型
EXCEL2007及以后的版本,文件格式是.xlsx,需要使用XSSFWorkbook类型
当使用错误的文件版本则出现问题.

解决方案:
根据文件后缀名使用不同的类型,缺点是如果更改了文件后缀名,而内容编码未变,依旧会异常.
推荐使用Workbook类型,HSSF与XSSF都实现此接口,其内部根据文件类型和头部信息判断.
Workbook wb = WorkbookFactory.create(numFile.getInputStream());


## MusicPlayerDaemon

MPD:No database

```
systemctl disable mpd.socket
```