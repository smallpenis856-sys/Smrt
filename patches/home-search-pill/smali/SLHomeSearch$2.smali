.class LSLHomeSearch$2;
.super Ljava/lang/Object;
.source "SLHomeSearch.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLHomeSearch;->onAttachedToWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:LSLHomeSearch;


# direct methods
.method constructor <init>(LSLHomeSearch;)V
    .locals 0

    .prologue
    .line 70
    iput-object p1, p0, LSLHomeSearch$2;->this$0:LSLHomeSearch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, LSLHomeSearch$2;->this$0:LSLHomeSearch;

    invoke-static {v0}, LSLHomeSearch;->access$200(LSLHomeSearch;)V

    return-void
.end method
