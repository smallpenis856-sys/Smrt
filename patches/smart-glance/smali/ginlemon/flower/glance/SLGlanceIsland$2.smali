.class Lginlemon/flower/glance/SLGlanceIsland$2;
.super Ljava/lang/Object;
.source "SLGlanceIsland.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lginlemon/flower/glance/SLGlanceIsland;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lginlemon/flower/glance/SLGlanceIsland;


# direct methods
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 2

    .prologue
    .line 99
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$2;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .registers 3

    .prologue
    .line 99
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$2;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$100(Lginlemon/flower/glance/SLGlanceIsland;)V

    const/4 v0, 0x1

    return v0
.end method
