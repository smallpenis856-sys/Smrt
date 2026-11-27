.class LSLWaContactSearch$3$1$1;
.super Ljava/lang/Object;
.source "SLWaContactSearch.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLWaContactSearch$3$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:LSLWaContactSearch$3$1;

.field final synthetic val$found:Ljava/util/List;


# direct methods
.method constructor <init>(LSLWaContactSearch$3$1;Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 124
    iput-object p1, p0, LSLWaContactSearch$3$1$1;->this$2:LSLWaContactSearch$3$1;

    iput-object p2, p0, LSLWaContactSearch$3$1$1;->val$found:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 125
    iget-object v0, p0, LSLWaContactSearch$3$1$1;->this$2:LSLWaContactSearch$3$1;

    iget-object v0, v0, LSLWaContactSearch$3$1;->this$1:LSLWaContactSearch$3;

    iget v0, v0, LSLWaContactSearch$3;->val$request:I

    iget-object v1, p0, LSLWaContactSearch$3$1$1;->this$2:LSLWaContactSearch$3$1;

    iget-object v1, v1, LSLWaContactSearch$3$1;->this$1:LSLWaContactSearch$3;

    iget-object v1, v1, LSLWaContactSearch$3;->this$0:LSLWaContactSearch;

    invoke-static {v1}, LSLWaContactSearch;->access$600(LSLWaContactSearch;)I

    move-result v1

    if-ne v0, v1, :cond_28

    iget-object v0, p0, LSLWaContactSearch$3$1$1;->this$2:LSLWaContactSearch$3$1;

    iget-object v0, v0, LSLWaContactSearch$3$1;->this$1:LSLWaContactSearch$3;

    iget-object v0, v0, LSLWaContactSearch$3;->this$0:LSLWaContactSearch;

    invoke-virtual {v0}, LSLWaContactSearch;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, LSLWaContactSearch$3$1$1;->this$2:LSLWaContactSearch$3$1;

    iget-object v0, v0, LSLWaContactSearch$3$1;->val$token:Landroid/os/CancellationSignal;

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 127
    :cond_28
    :goto_28
    return-void

    .line 126
    :cond_29
    iget-object v0, p0, LSLWaContactSearch$3$1$1;->this$2:LSLWaContactSearch$3$1;

    iget-object v0, v0, LSLWaContactSearch$3$1;->this$1:LSLWaContactSearch$3;

    iget-object v0, v0, LSLWaContactSearch$3;->this$0:LSLWaContactSearch;

    iget-object v1, p0, LSLWaContactSearch$3$1$1;->val$found:Ljava/util/List;

    invoke-static {v0, v1}, LSLWaContactSearch;->access$700(LSLWaContactSearch;Ljava/util/List;)V

    goto :goto_28
.end method
