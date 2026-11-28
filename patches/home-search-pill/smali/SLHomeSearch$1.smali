.class LSLHomeSearch$1;
.super Ljava/lang/Object;
.source "SLHomeSearch.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLHomeSearch;-><init>(Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
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
    .line 55
    iput-object p1, p0, LSLHomeSearch$1;->this$0:LSLHomeSearch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, LSLHomeSearch$1;->this$0:LSLHomeSearch;

    invoke-static {v0}, LSLHomeSearch;->access$100(LSLHomeSearch;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 62
    :cond_0
    :goto_0
    return-void

    .line 57
    :cond_1
    iget-object v0, p0, LSLHomeSearch$1;->this$0:LSLHomeSearch;

    invoke-virtual {v0}, LSLHomeSearch;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 58
    :goto_1
    instance-of v0, v1, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_2

    instance-of v0, v1, Lginlemon/flower/HomeScreen;

    if-nez v0, :cond_2

    move-object v0, v1

    .line 59
    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-eq v0, v1, :cond_0

    move-object v1, v0

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    instance-of v0, v1, Lginlemon/flower/HomeScreen;

    if-eqz v0, :cond_0

    check-cast v1, Lginlemon/flower/HomeScreen;

    invoke-virtual {v1}, Lginlemon/flower/HomeScreen;->H()V

    goto :goto_0
.end method
