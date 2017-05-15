//
//  main.m
//  Queue
//
//  Created by 赵哲 on 2017/5/2.
//  Copyright © 2017年 赵哲. All rights reserved.
// 循环队列

#import <Foundation/Foundation.h>

typedef struct QUEUE
{
    int * pBase;
    int front;//头
    int rear;//尾
    int len;
}Queue;
//初始化
void init_queue(Queue *queue,int len);
//入队
void en_queue(Queue *queue,int data);
//出队
void out_queue(Queue *queue,int *pData);
//遍历
void traverse_queue(Queue *queue);
//是否是满的
bool full_queue(Queue * queue);
//是否是空
bool empty_queue(Queue *queue);

int main(int argc, const char * argv[]) {

    Queue queue;
    init_queue(&queue, 6);
    
    en_queue(&queue, 1);
    en_queue(&queue, 2);
    en_queue(&queue, 3);
    
    out_queue(&queue, NULL);
    out_queue(&queue, NULL);
    en_queue(&queue, 4);
    en_queue(&queue, 5);
    en_queue(&queue, 6);
    
    traverse_queue(&queue);
    
    return 0;
}
//初始化
void init_queue(Queue *queue,int len)
{
    queue->pBase = (int *)malloc(sizeof(int) * len);
    queue->front = 0;
    queue->rear = 0;
    queue->len = len;
}

//入队
void en_queue(Queue *queue,int data)
{
    if (full_queue(queue)) {
        printf("队列已满");
        return;
    }else
    {
        queue->pBase[queue->rear] = data;
        queue->rear = (queue->rear + 1) % queue->len;
    }
}
//遍历
void traverse_queue(Queue *queue)
{
    int i = queue->front;
    while (queue->rear != i) {
        printf("%d   ",queue->pBase[i]);
        i = (i + 1) %  queue->len;
    }
}
//是否是满的
bool full_queue(Queue * queue)
{
    if ((queue->rear + 1) % queue->len == queue->front) {
        return true;
    }else
    {
        return false;
    }
}
//出队
void out_queue(Queue *queue,int *pData)
{
    if (empty_queue(queue)) {
        printf("队列为空");
        return;
    }else
    {
        if (pData != NULL) {
            *pData = queue->front;
        }
        queue->front = (queue->front + 1) % queue->len;
    }
}
//是否是空
bool empty_queue(Queue *queue)
{
    if (queue->front == queue->rear) {
        return true;
    }else
    {
        return false;
    }
}
