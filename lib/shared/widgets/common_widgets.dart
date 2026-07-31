import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.isText = false,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.height = 52,
    this.borderRadius = 12,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final bool isText;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    if (isText) {
      return TextButton(
        onPressed: isLoading ? null : onPressed,
        child: _buildChild(context),
      );
    }

    if (isOutlined) {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: BorderSide(
            color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          ),
        ),
        child: _buildChild(context),
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, height),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            textColor ?? Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(text),
        ],
      );
    }

    return Text(text);
  }
}

class BloodGroupChip extends StatelessWidget {
  const BloodGroupChip({
    super.key,
    required this.bloodGroup,
    this.isSelected = false,
    this.onTap,
    this.isLarge = false,
  });

  final String bloodGroup;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isLarge ? 20 : 12,
          vertical: isLarge ? 12 : 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.primaryContainer.withOpacity(0.3),
          borderRadius: BorderRadius.circular(isLarge ? 12 : 8),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          bloodGroup,
          style: TextStyle(
            fontSize: isLarge ? 18 : 14,
            fontWeight: FontWeight.w700,
            color: isSelected ? colorScheme.onPrimary : colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    this.width = double.infinity,
    this.height = 80,
    this.borderRadius = 12,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
      highlightColor: isDark ? Colors.grey.shade700 : Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isDark ? Colors.grey.shade900 : Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  const ShimmerList({
    super.key,
    this.itemCount = 3,
    this.itemHeight = 80,
  });

  final int itemCount;
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemCount,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: index < itemCount - 1 ? 12 : 0),
          child: ShimmerLoading(height: itemHeight),
        ),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onAction,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final String? actionText;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionText != null && onAction != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onAction,
                child: Text(actionText!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    required this.color,
    this.icon,
  });

  final String label;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class DonorCard extends StatelessWidget {
  const DonorCard({
    super.key,
    required this.name,
    required this.bloodGroup,
    this.distance,
    this.rating,
    this.photoUrl,
    this.onTap,
    this.onChat,
    this.isAvailable = true,
  });

  final String name;
  final String bloodGroup;
  final String? distance;
  final double? rating;
  final String? photoUrl;
  final VoidCallback? onTap;
  final VoidCallback? onChat;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: colorScheme.primaryContainer,
                backgroundImage:
                    photoUrl != null ? NetworkImage(photoUrl!) : null,
                child: photoUrl == null
                    ? Text(
                        name.isNotEmpty ? name[0].toUpperCase() : '?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: isAvailable
                                ? Colors.green.withOpacity(0.1)
                                : Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            isAvailable ? 'Available' : 'Busy',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: isAvailable ? Colors.green : Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            bloodGroup,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: colorScheme.error,
                            ),
                          ),
                        ),
                        if (distance != null) ...[
                          const SizedBox(width: 8),
                          Text(
                            distance!,
                            style: TextStyle(
                              fontSize: 12,
                              color: colorScheme.outline,
                            ),
                          ),
                        ],
                        if (rating != null) ...[
                          const SizedBox(width: 8),
                          Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text(
                            rating!.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              if (onChat != null)
                IconButton(
                  onPressed: onChat,
                  icon: const Icon(Icons.chat_bubble_outline),
                  style: IconButton.styleFrom(
                    backgroundColor: colorScheme.surfaceContainerHighest,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({
    super.key,
    required this.targetDate,
    this.style,
  });

  final DateTime targetDate;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        final now = DateTime.now();
        if (targetDate.isBefore(now)) {
          return Text(
            'Expired',
            style: style?.copyWith(color: Colors.red) ??
                const TextStyle(color: Colors.red),
          );
        }
        final diff = targetDate.difference(now);
        final hours = diff.inHours;
        final minutes = diff.inMinutes % 60;
        final seconds = diff.inSeconds % 60;
        return Text(
          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
          style: style ?? const TextStyle(),
        );
      },
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        if (actionLabel != null && onAction != null)
          TextButton(
            onPressed: onAction,
            child: Text(actionLabel!),
          ),
      ],
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    this.message = 'Something went wrong',
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              AppButton(
                text: 'Try Again',
                onPressed: onRetry,
                isOutlined: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(32),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                if (message != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    message!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppDialog {
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    Color? confirmColor,
    bool isDestructive = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelLabel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: isDestructive
                  ? Colors.red
                  : confirmColor ?? Theme.of(context).colorScheme.primary,
            ),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }
}

class InfoBanner extends StatelessWidget {
  const InfoBanner({
    super.key,
    required this.icon,
    required this.message,
    this.type = InfoBannerType.info,
  });

  final IconData icon;
  final String message;
  final InfoBannerType type;

  @override
  Widget build(BuildContext context) {
    final color = switch (type) {
      InfoBannerType.info => Colors.blue,
      InfoBannerType.success => Colors.green,
      InfoBannerType.warning => Colors.orange,
      InfoBannerType.error => Colors.red,
    };

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(fontSize: 13, color: color.shade700),
            ),
          ),
        ],
      ),
    );
  }
}

enum InfoBannerType { info, success, warning, error }
