# 實驗八:簡易CPU實作

## 基本項目

須先設計出如圖一的Simple Processor,其指令執行之時序之控制 機制使用FSM狀態機(Mealy機)實現。其中的ALU設計可參考 下張投影片。

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/36c63446-c815-4088-999c-2c2686dbd2f5)


## ALU說明圖例

1-bit ALU

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/7686207e-6848-4e45-afaa-4001fdfcaceb)

4-bit ALU

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/7f7eb88c-f14c-4e09-ba04-da13d4362581)


## 基本功能

Simple Processor的基本功能需有:LOAD、MOVE、AND、ADD 、SUB和Slt等六個功能,詳細介紹如下表:

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/b38c94e0-7e13-4f7b-a8e9-cd530c63efbc)


## RS、RT概念

RS和RT分別指到要做動作的暫存器(七段顯示器須同步更新),例 如Add R0, R2 就要將RS指到R0,RT則指到R2後,opcode為0010 來進行Add的動作。

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/1065522d-2dcd-4a37-95dd-996619de41db)

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/b7ce37ba-5cb3-4e90-8952-f7eeb9d50db9)


## 實驗要求 簡易CPU實作

- 總共有四個暫存器(R0,R1,R2,R3),使用RS和RT分別指定要使用的暫存器(七段顯示器須同步更新)。
- 使用七段顯示器顯示Rs、Rt及BUS的值。
- BUS為當下Data輸入的值以七段顯示器顯示。
- Load、Move為必要完成的功能,需實現這兩個功能本次實驗才有分數。


## 實驗要求-七段顯示器的使用

- 七段顯示器顯示為十六進制,兩顆七段顯示器為一組,範圍為1~FF(超過FF顯示末兩位)。
- 左邊兩組顯示Rt及Rs兩個暫存器。
- 最右邊一組則持續顯示Bus的數值。
- 當執行指令時,暫存器的內容被改變,則七段顯示器須同步更新。
- 顯示範圍為0-FF。


## 按鈕開關的使用(僅供參考)

- 當指撥開關接設定好後,須使用按鈕開關將其輸入,在這裡,指令和暫存器(或Data)的輸入是使用指令時序的方式,且須用狀態機來實現指令和暫存器(或Data)的時序,也就是說指撥開關設定好後,其運作程序範例如下(使用clock觸發):
- 將資料透過Bus輸入暫存器。
- 依照instruction code來判斷,輸入指定暫存器與執行指令,並顯示更新暫存器與Bus的數值。


## 指撥開關的使用

指撥開關以8bits輸入Instruction code(4bits為Opcode,2bits為Rs, 2bit為Rt),8Bits指定Data,說明如下:

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/3846fb1e-002a-4528-86ed-f87f4a9f3a4c)

流程範例:手撥sw輸入data值,此時會馬上顯示bus值(七段顯示) ,接著Rs、Rt指向指定暫存器,按下clock來進行load data的動作 到Rs所指向的暫存器,此時Rs、Rt的值會顯示在七段上(依照Rs 、Rt所指向的位置),後續為撥好opcode且依照clock的動作來進 行操作。


## 實驗配分

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/d04cf43d-e689-469a-9dff-c7ecbd6c4c37)

- 橘色區塊為必要功能,一定要實現才算完成實驗,可得30%。
- 黃色區塊配分如右表,共40%。
- 報告30%


## 指定腳位 – 輸入

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/06a35671-d3da-4cb3-9abb-30b73811b8d3)

## 指定腳位 –七段顯示器Bus

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/9c4098b0-a323-42f0-be41-29a16bd46774)


## 指定腳位 –七段顯示器Rs

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/74d052d3-de8e-42a5-97c0-b9c5642f995d)


## 指定腳位 –七段顯示器Rt

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/ce82d1d3-693e-4e76-9c44-9a3128772c6c)
