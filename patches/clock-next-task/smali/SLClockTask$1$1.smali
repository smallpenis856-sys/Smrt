.class LSLClockTask$1$1;
.super Ljava/lang/Object;
.source "SLClockTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLClockTask$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:LSLClockTask$1;

.field final synthetic val$item:LSLTaskChoice$Item;


# direct methods
.method constructor <init>(LSLClockTask$1;LSLTaskChoice$Item;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 68
    iput-object p1, p0, LSLClockTask$1$1;->this$1:LSLClockTask$1;

    iput-object p2, p0, LSLClockTask$1$1;->val$item:LSLTaskChoice$Item;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 69
    iget-object v0, p0, LSLClockTask$1$1;->this$1:LSLClockTask$1;

    iget-object v0, v0, LSLClockTask$1;->this$0:LSLClockTask;

    invoke-static {v0}, LSLClockTask;->access$100(LSLClockTask;)Z

    move-result v0

    if-nez v0, :cond_18

    iget-object v0, p0, LSLClockTask$1$1;->this$1:LSLClockTask$1;

    iget v0, v0, LSLClockTask$1;->val$request:I

    iget-object v1, p0, LSLClockTask$1$1;->this$1:LSLClockTask$1;

    iget-object v1, v1, LSLClockTask$1;->this$0:LSLClockTask;

    invoke-static {v1}, LSLClockTask;->access$200(LSLClockTask;)I

    move-result v1

    if-eq v0, v1, :cond_19

    .line 79
    :cond_18
    :goto_18
    return-void

    .line 70
    :cond_19
    iget-object v0, p0, LSLClockTask$1$1;->this$1:LSLClockTask$1;

    iget-object v1, v0, LSLClockTask$1;->this$0:LSLClockTask;

    iget-object v0, p0, LSLClockTask$1$1;->val$item:LSLTaskChoice$Item;

    if-nez v0, :cond_3f

    const-string v0, "No upcoming tasks"

    :goto_23
    invoke-static {v1, v0}, LSLClockTask;->access$302(LSLClockTask;Ljava/lang/String;)Ljava/lang/String;

    .line 71
    iget-object v0, p0, LSLClockTask$1$1;->val$item:LSLTaskChoice$Item;

    if-nez v0, :cond_48

    iget-object v0, p0, LSLClockTask$1$1;->this$1:LSLClockTask$1;

    iget-object v0, v0, LSLClockTask$1;->this$0:LSLClockTask;

    const-string v1, ""

    invoke-static {v0, v1}, LSLClockTask;->access$402(LSLClockTask;Ljava/lang/String;)Ljava/lang/String;

    .line 78
    :goto_33
    iget-object v0, p0, LSLClockTask$1$1;->this$1:LSLClockTask$1;

    iget-object v0, v0, LSLClockTask$1;->this$0:LSLClockTask;

    invoke-static {v0}, LSLClockTask;->access$500(LSLClockTask;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    goto :goto_18

    .line 70
    :cond_3f
    iget-object v0, p0, LSLClockTask$1$1;->val$item:LSLTaskChoice$Item;

    iget-object v0, v0, LSLTaskChoice$Item;->title:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_23

    .line 73
    :cond_48
    iget-object v0, p0, LSLClockTask$1$1;->val$item:LSLTaskChoice$Item;

    iget-object v0, v0, LSLTaskChoice$Item;->date:Ljava/lang/String;

    .line 74
    :try_start_4c
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v2

    iget-object v3, p0, LSLClockTask$1$1;->val$item:LSLTaskChoice$Item;

    iget-object v3, v3, LSLTaskChoice$Item;->date:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_69} :catch_ad

    move-result-object v0

    .line 76
    :goto_6a
    iget-object v1, p0, LSLClockTask$1$1;->this$1:LSLClockTask$1;

    iget-object v1, v1, LSLClockTask$1;->this$0:LSLClockTask;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, p0, LSLClockTask$1$1;->val$item:LSLTaskChoice$Item;

    iget-object v0, v0, LSLTaskChoice$Item;->time:Ljava/lang/String;

    if-eqz v0, :cond_87

    iget-object v0, p0, LSLClockTask$1$1;->val$item:LSLTaskChoice$Item;

    iget-object v0, v0, LSLTaskChoice$Item;->time:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_95

    :cond_87
    const-string v0, ""

    :goto_89
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, LSLClockTask;->access$402(LSLClockTask;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_33

    :cond_95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " \u2022 "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, LSLClockTask$1$1;->val$item:LSLTaskChoice$Item;

    iget-object v3, v3, LSLTaskChoice$Item;->time:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_89

    .line 75
    :catch_ad
    move-exception v1

    goto :goto_6a
.end method
