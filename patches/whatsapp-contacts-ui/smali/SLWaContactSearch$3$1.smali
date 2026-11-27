.class LSLWaContactSearch$3$1;
.super Ljava/lang/Object;
.source "SLWaContactSearch.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLWaContactSearch$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:LSLWaContactSearch$3;

.field final synthetic val$token:Landroid/os/CancellationSignal;


# direct methods
.method constructor <init>(LSLWaContactSearch$3;Landroid/os/CancellationSignal;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 114
    iput-object p1, p0, LSLWaContactSearch$3$1;->this$1:LSLWaContactSearch$3;

    iput-object p2, p0, LSLWaContactSearch$3$1;->val$token:Landroid/os/CancellationSignal;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 115
    iget-object v0, p0, LSLWaContactSearch$3$1;->this$1:LSLWaContactSearch$3;

    iget-object v0, v0, LSLWaContactSearch$3;->this$0:LSLWaContactSearch;

    iget-object v1, p0, LSLWaContactSearch$3$1;->this$1:LSLWaContactSearch$3;

    iget-object v1, v1, LSLWaContactSearch$3;->val$text:Ljava/lang/String;

    iget-object v2, p0, LSLWaContactSearch$3$1;->val$token:Landroid/os/CancellationSignal;

    invoke-static {v0, v1, v2}, LSLWaContactSearch;->access$500(LSLWaContactSearch;Ljava/lang/String;Landroid/os/CancellationSignal;)Ljava/util/List;

    move-result-object v0

    .line 116
    iget-object v1, p0, LSLWaContactSearch$3$1;->this$1:LSLWaContactSearch$3;

    iget-object v1, v1, LSLWaContactSearch$3;->this$0:LSLWaContactSearch;

    invoke-static {v1}, LSLWaContactSearch;->access$800(LSLWaContactSearch;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, LSLWaContactSearch$3$1$1;

    invoke-direct {v2, p0, v0}, LSLWaContactSearch$3$1$1;-><init>(LSLWaContactSearch$3$1;Ljava/util/List;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 120
    return-void
.end method
