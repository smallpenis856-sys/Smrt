.class LSLWaContactSearch$3;
.super Ljava/lang/Object;
.source "SLWaContactSearch.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLWaContactSearch;->schedule()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:LSLWaContactSearch;

.field final synthetic val$request:I

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(LSLWaContactSearch;Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 105
    iput-object p1, p0, LSLWaContactSearch$3;->this$0:LSLWaContactSearch;

    iput-object p2, p0, LSLWaContactSearch$3;->val$text:Ljava/lang/String;

    iput p3, p0, LSLWaContactSearch$3;->val$request:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 106
    iget-object v0, p0, LSLWaContactSearch$3;->this$0:LSLWaContactSearch;

    const/4 v1, 0x0

    invoke-static {v0, v1}, LSLWaContactSearch;->access$202(LSLWaContactSearch;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 107
    new-instance v0, Landroid/os/CancellationSignal;

    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    .line 108
    iget-object v1, p0, LSLWaContactSearch$3;->this$0:LSLWaContactSearch;

    invoke-static {v1, v0}, LSLWaContactSearch;->access$302(LSLWaContactSearch;Landroid/os/CancellationSignal;)Landroid/os/CancellationSignal;

    .line 109
    iget-object v1, p0, LSLWaContactSearch$3;->this$0:LSLWaContactSearch;

    invoke-static {}, LSLWaContactSearch;->access$900()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    new-instance v3, LSLWaContactSearch$3$1;

    invoke-direct {v3, p0, v0}, LSLWaContactSearch$3$1;-><init>(LSLWaContactSearch$3;Landroid/os/CancellationSignal;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    invoke-static {v1, v0}, LSLWaContactSearch;->access$402(LSLWaContactSearch;Ljava/util/concurrent/Future;)Ljava/util/concurrent/Future;

    .line 116
    return-void
.end method
